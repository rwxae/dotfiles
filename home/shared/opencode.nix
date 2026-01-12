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
            "qwen3-coder:30b".name = "qwen3-coder";
            "gpt-oss:20b".name = "gpt-oss";
            "qwen3:8b".name = "qwen3 (8b)";
          };
        };
      };
    };
  };
}
