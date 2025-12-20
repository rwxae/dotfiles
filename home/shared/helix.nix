{ lib, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor.cursor-shape.insert = "bar";
      keys = {
        normal = {
          space = {
            o = ":reset-diff-change";
            i = ":sh git show --no-patch --format='%%h (%%an: %%ar): %%s' $(git blame -p %{buffer_name} -L%{cursor_line},+1 | head -1 | cut -d' ' -f1)";
          };
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
          # eslintFormatter = {
          #   command = "npx";
          #   args = [
          #     "eslint"
          #     "--stdin"
          #     "--fix-to-stdout"
          #     "--stdin-filename %{buffer_name}"
          #     "--flag v10_config_lookup_from_file"
          #   ];
          # };
        in
        [
          {
            name = "markdown";
            language-servers = [
              "marksman"
              "tailwindcss"
              "codebook"
            ];
            formatter = mkPrettierFormatter "mdx";
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
            formatter = mkPrettierFormatter "html";
          }
          {
            name = "css";
            language-servers = [
              "vscode-css-language-server"
              "tailwindcss"
              "codebook"
            ];
            formatter = mkPrettierFormatter "css";
          }
          {
            name = "scss";
            language-servers = [
              "vscode-css-language-server"
              "tailwindcss"
              "codebook"
            ];
            formatter = mkPrettierFormatter "scss";
          }
          {
            name = "javascript";
            language-servers = [
              {
                name = "typescript-language-server";
                except-features = [ "format" ];
              }
              "vscode-eslint-language-server"
              "tailwindcss"
              "codebook"
            ];
            # formatter = eslintFormatter;
            auto-format = true;
          }
          {
            name = "typescript";
            language-servers = [
              {
                name = "typescript-language-server";
                except-features = [ "format" ];
              }
              "vscode-eslint-language-server"
              "tailwindcss"
              "codebook"
            ];
            # formatter = eslintFormatter;
            auto-format = true;
          }
          {
            name = "jsx";
            language-servers = [
              {
                name = "typescript-language-server";
                except-features = [ "format" ];
              }
              "vscode-eslint-language-server"
              "tailwindcss"
              "codebook"
            ];
            # formatter = eslintFormatter;
            auto-format = true;
          }
          {
            name = "tsx";
            language-servers = [
              {
                name = "typescript-language-server";
                except-features = [ "format" ];
              }
              "vscode-eslint-language-server"
              "tailwindcss"
              "codebook"
            ];
            # formatter = eslintFormatter;
            auto-format = true;
          }
        ];
    };
  };
}
