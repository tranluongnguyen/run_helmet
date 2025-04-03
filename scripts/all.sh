module load cuda/12.6
source /work/pi_rrahimi_umass_edu/will/run/helmet_env2/bin/activate


MODEL_NAME="/datasets/ai/deepseek/hub/models--deepseek-ai--DeepSeek-R1-Distill-Qwen-7B/snapshots/6602cadec947dbb53e64f3d8d6425320b2197247/"
OUT_DIR="/home/ngultran_umass_edu/outputs/R1-qwen"


for task in rag rerank cite; do
  python eval.py --config configs/${task}_distill.yaml \
    --model_name_or_path $MODEL_NAME \
    --use_chat_template False
done

MODEL_NAME="/datasets/ai/deepseek/hub/models--deepseek-ai--DeepSeek-R1-Distill-Llama-8B/snapshots/74fbf131a939963dd1e244389bb61ad0d0440a4d/"
OUT_DIR="/home/ngultran_umass_edu/outputs/R1-llama"


for task in rag rerank cite; do
  python eval.py --config configs/${task}_distill.yaml \
    --model_name_or_path $MODEL_NAME \
    --use_chat_template False
done

MODEL_NAME="/datasets/ai/llama3/hub/models--meta-llama--Meta-Llama-3.1-8B/snapshots/48d6d0fc4e02fb1269b36940650a1b7233035cbb/"
OUT_DIR="/home/ngultran_umass_edu/outputs/llama"


for task in rag rerank cite; do
  python eval.py --config configs/${task}_distill.yaml \
    --model_name_or_path $MODEL_NAME \
    --use_chat_template False
done
