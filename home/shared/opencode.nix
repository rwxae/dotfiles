{ ... }:

{
  programs.opencode = {
    enable = true;
    settings = {
      provider = {
        ollama = {
          npm = "@ai-sdk/openai-compatible";
          name = "Ollama (local)";
          options.baseURL = "http://localhost:11434/v1";
          models = {
            "qwen3:8b".name = "Qwen3 (8b)";
            "deepseek-r1:8b".name = "DeepSeek-R1 (8b)";
            "llama3.1:8b".name = "Llama 3.1 8B";
          };
        };
      };
    };
  };
}
