{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bun
    opencode
  ];

  xdg.configFile."opencode/opencode.json".text = ''
    {
      "$schema": "https://opencode.ai/config.json",
      "model": "opencode-go/glm-5.1",
      "default_agent": "build",
      "agent": {
        "general": {
          "model": "anthropic/claude-sonnet-4-6"
        },
        "plan": {
          "model": "anthropic/claude-opus-4-6"
        },
        "build": {
          "model": "opencode-go/deepseek-v4-flash",
          "reasoning_effort": "high",
          "max_execution": "none"
        },
        "explore": {
          "model": "opencode-go/qwen-3.5-plus"
        },
        "writing": {
          "model": "opencode-go/kimi-k2.6"
        },
        "architecture": {
          "model": "opencode-go/deepseek-v4-pro"
        }
      },
      "plugin": [
        "@ex-machina/opencode-anthropic-auth@1.8.0",
        "superpowers@git+https://github.com/obra/superpowers.git",
        "opencode-websearch"
      ]
    }
  '';
}
