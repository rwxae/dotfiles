{ lib, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor.cursor-shape.insert = "bar";
    };
    languages = {
      language-server = {
        codebook = {
          command = lib.getExe pkgs.codebook;
          args = [ "serve" ];
        };
        tailwindcss = {
          command = lib.getExe pkgs.tailwindcss-language-server;
          args = [ "--stdio" ];
        };
        emmet = {
          command = lib.getExe pkgs.emmet-language-server;
          args = [ "--stdio" ];
        };
      };
      language = [
        {
          name = "markdown";
          language-servers = [
            "marksman"
            "tailwindcss"
            "codebook"
          ];
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "mdx"
            ];
          };
          auto-format = true;
        }
        {
          name = "nix";
          language-servers = [
            "nil"
            "codebook"
          ];
          auto-format = true;
        }
        {
          name = "html";
          language-servers = [
            "vscode-html-language-server"
            "tailwindcss"
            "emmet"
            "codebook"
          ];
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "html"
            ];
          };
        }
        {
          name = "css";
          language-servers = [
            "vscode-css-language-server"
            "tailwindcss"
            "codebook"
          ];
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "css"
            ];
          };
        }
        {
          name = "scss";
          language-servers = [
            "vscode-css-language-server"
            "tailwindcss"
            "codebook"
          ];
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "scss"
            ];
          };
        }
        {
          name = "javascript";
          language-servers = [
            "typescript-language-server"
            "vscode-eslint-language-server"
            "tailwindcss"
            "codebook"
          ];
        }
        {
          name = "typescript";
          language-servers = [
            "typescript-language-server"
            "vscode-eslint-language-server"
            "tailwindcss"
            "codebook"
          ];
        }
        {
          name = "jsx";
          language-servers = [
            "typescript-language-server"
            "vscode-eslint-language-server"
            "tailwindcss"
            "codebook"
          ];
        }
        {
          name = "tsx";
          language-servers = [
            "typescript-language-server"
            "vscode-eslint-language-server"
            "tailwindcss"
            "codebook"
          ];
        }
      ];
    };
  };
}
