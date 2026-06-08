{ lib, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor = {
        cursor-shape.insert = "bar";
        default-yank-register = "+";
      };
      keys = {
        normal = {
          space = {
            o = ":reset-diff-change";
            i = ":sh git show --no-patch --format='%%h (%%an: %%ar): %%s' $(git blame -p %{buffer_name} -L%{cursor_line},+1 | head -1 | cut -d' ' -f1)";
          };
          C-e = [
            ":sh rm -f /tmp/unique-file-h21a434"
            ":insert-output yazi '%{buffer_name}' --chooser-file=/tmp/unique-file-h21a434"
            ":insert-output echo \"x1b[?1049h\" > /dev/tty"
            ":open %sh{cat /tmp/unique-file-h21a434}"
            ":redraw"
          ];
          C-g = [
            ":insert-output gitui >/dev/tty"
            ":redraw"
            ":reload-all"
          ];
        };
      };
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
        rust-analyzer = {
          config.check.command = "clippy";
        };
        # TODO: https://github.com/helix-editor/helix/pull/15853
        nginx-language-server = {
          command = lib.getExe pkgs.nginx-language-server;
        };
        # TODO: it doesn't work
        # vscode-eslint-language-server = {
        #   config.codeActionsOnSave = {
        #     "source.fixAll.eslint" = true;
        #   };
        # };
      };
      language =
        let
          mkPrettierFormatter = parser: {
            command = "prettier";
            args = [
              "--parser"
              parser
            ];
          };
          # TODO: ESLint should be implemented as LSP with format feature enabled
          eslintFormatter = {
            command =
              {
                name = "eslint-fix";
                runtimeInputs = with pkgs; [
                  eslint_d
                ];
                text = ''
                  eslint_d --fix-to-stdout --stdin --stdin-filename "$(pwd)"/"$(basename "$1")"
                '';
              }
              |> pkgs.writeShellApplication
              |> lib.getExe;
            args = [
              "%{buffer_name}"
            ];
          };
          typescript = {
            name = "typescript-language-server";
            except-features = [ "format" ];
          };
          # TODO: https://github.com/helix-editor/helix/pull/14804
          commonLSPs = [
            "codebook"
          ];
        in
        [
          {
            name = "git-commit";
            language-servers = [
              "commit-lsp"
            ]
            ++ commonLSPs;
          }
          {
            name = "markdown";
            language-servers = [
              "marksman"
              "tailwindcss"
            ]
            ++ commonLSPs;
            formatter = mkPrettierFormatter "mdx";
            auto-format = true;
          }
          {
            name = "nix";
            language-servers = [
              "nil"
            ]
            ++ commonLSPs;
            auto-format = true;
          }
          {
            name = "html";
            language-servers = [
              "vscode-html-language-server"
              "tailwindcss"
              "emmet"
            ]
            ++ commonLSPs;
            formatter = mkPrettierFormatter "html";
          }
          {
            name = "css";
            language-servers = [
              "vscode-css-language-server"
              "tailwindcss"
            ]
            ++ commonLSPs;
            formatter = mkPrettierFormatter "css";
          }
          {
            name = "scss";
            language-servers = [
              "vscode-css-language-server"
              "tailwindcss"
            ]
            ++ commonLSPs;
            formatter = mkPrettierFormatter "scss";
          }
          {
            name = "javascript";
            language-servers = [
              typescript
              "vscode-eslint-language-server"
              "tailwindcss"
            ]
            ++ commonLSPs;
            formatter = eslintFormatter;
            auto-format = true;
          }
          {
            name = "typescript";
            language-servers = [
              typescript
              "vscode-eslint-language-server"
              "tailwindcss"
            ]
            ++ commonLSPs;
            formatter = eslintFormatter;
            auto-format = true;
          }
          {
            name = "jsx";
            language-servers = [
              typescript
              "vscode-eslint-language-server"
              "tailwindcss"
            ]
            ++ commonLSPs;
            formatter = eslintFormatter;
            auto-format = true;
          }
          {
            name = "tsx";
            language-servers = [
              typescript
              "vscode-eslint-language-server"
              "tailwindcss"
            ]
            ++ commonLSPs;
            formatter = eslintFormatter;
            auto-format = true;
          }
          {
            name = "rust";
            language-servers = [
              "rust-analyzer"
            ]
            ++ commonLSPs;
          }
          {
            name = "nginx";
            language-servers = [
              "nginx-language-server"
            ]
            ++ commonLSPs;
          }
        ];
    };
  };
}
