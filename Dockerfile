FROM registry.access.redhat.com/ubi9/python-311:latest

# Update and install essential tools
RUN dnf install -y gcc-c++ make git && \
    dnf clean all

# Upgrade pip and install PyTorch (CPU-only) and Hugging Face libraries
RUN python -m pip install --upgrade pip setuptools wheel && \
    python -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu && \
    python -m pip install transformers huggingface_hub datasets sentencepiece tokenizers

# Optional cleanup to reduce image size
RUN rm -rf ~/.cache/pip

# Set default working directory
WORKDIR /app

# Default entrypoint (change according to your needs)
ENTRYPOINT ["python3"]
