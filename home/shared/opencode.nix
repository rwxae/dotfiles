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
            "qwen3-coder:30b".name = "Qwen3-Coder (30b)";
            "gpt-oss:20b".name = "gpt-oss (20b)";
            "qwen3:8b".name = "Qwen3 (8b)";
            "deepseek-r1:8b".name = "DeepSeek-R1 (8b)";
          };
        };
      };
    };
  };
}
