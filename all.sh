#!/bin/bash
#SBATCH --job-name=rg_hm
#SBATCH -o ./slurm_outpuslurmt/%A.out
#SBATCH -e ./slurm_output/%A.err

#SBATCH -N 1
#SBATCH --partition=superpod-a100
#SBATCH -C vram80
#SBATCH -G 2
#SBATCH -c 8
#SBATCH --mem-per-gpu=200G
#SBATCH -t 7-00:00:00
#SBATCH -n 1



module load cuda/12.6
source /work/pi_rrahimi_umass_edu/will/p2/helmet_env2/bin/activate

MODEL_NAME="DeepSeek-R1-Distill-Qwen-7B"


for task in rag rerank cite; do
  python eval.py --config configs/${task}_cf1.yaml \
    --model_name_or_path /datasets/ai/deepseek/hub/models--deepseek-ai--$MODEL_NAME/snapshots/6602cadec947dbb53e64f3d8d6425320b2197247/ \
    --use_chat_template False
done

MODEL_NAME="DeepSeek-R1-Distill-Llama-8B"


for task in rag rerank cite; do
  python eval.py --config configs/${task}_cf1.yaml \
    --model_name_or_path /datasets/ai/deepseek/hub/models--deepseek-ai--$MODEL_NAME/snapshots/74fbf131a939963dd1e244389bb61ad0d0440a4d/ \
    --use_chat_template False
done

MODEL_NAME="Meta-Llama-3.1-8B"
OUT_DIR="/home/ngultran_umass_edu/outputs/llama"


for task in rag rerank; do
  python eval.py --config configs/${task}_cf1.yaml \
    --model_name_or_path /datasets/ai/llama3/hub/models--meta-llama--$MODEL_NAME/snapshots/48d6d0fc4e02fb1269b36940650a1b7233035cbb/ \
    --use_chat_template False
done
