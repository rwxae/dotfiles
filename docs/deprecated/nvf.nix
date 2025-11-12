{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        git.enable = true;
        clipboard = {
          enable = true;
          registers = "unnamedplus";
        };
        spellcheck = {
          enable = true;
          languages = [
            "en"
            "ru"
          ];
        };
        telescope = {
          enable = true;
          extensions = [
            {
              name = "fzf";
              packages = with pkgs.vimPlugins; [
                telescope-fzf-native-nvim
              ];
            }
          ];
        };
        filetree.neo-tree.enable = true;
        notes.todo-comments.enable = true;
        assistant.supermaven-nvim = {
          enable = true;
          setupOpts.keymaps = {
            accept_suggestion = "<C-n>";
          };
        };
        utility = {
          surround = {
            enable = true;
            useVendoredKeybindings = false;
          };
        };
        lsp = {
          enable = true;
          formatOnSave = true;
          inlayHints.enable = true;
          servers = {
            eslint = { };
            tailwindcss = { };
          };
          mappings = {
            goToDeclaration = "gD";
            goToDefinition = "gd";
            goToType = "gY";
            listImplementations = "gI";
            listReferences = "gA";
            renameSymbol = "cd";
          };
        };
        languages = {
          enableExtraDiagnostics = true;
          enableFormat = true;
          enableTreesitter = true;
          nix = {
            enable = true;
            format = {
              package = pkgs.nixfmt;
              type = "nixfmt";
            };
          };
          ts = {
            enable = true;
            format.enable = false;
          };
          markdown.enable = true;
          html.enable = true;
        };
        autocomplete.blink-cmp.enable = true;
        startPlugins = with pkgs.vimPlugins; [
          ReplaceWithRegister
          vim-exchange
        ];
        lazy.plugins = with pkgs.vimPlugins; {
          "guess-indent.nvim" = {
            package = guess-indent-nvim;
            setupModule = "guess-indent";
          };
        };
        options = {
          ignorecase = true;
          smartcase = true;
          scrolloff = 8;
          updatetime = 50;
          langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz";
        };
        keymaps = [
          {
            key = "<Esc>";
            mode = "n";
            action = "<Cmd>nohlsearch<CR>";
          }
          {
            key = "<leader>t";
            mode = "n";
            action = "<Cmd>Neotree reveal toggle right<CR>";
          }
          {
            key = "gR";
            mode = "n";
            action = "<Plug>ReplaceWithRegisterOperator";
          }
          {
            key = "gRR";
            mode = "n";
            action = "<Plug>ReplaceWithRegisterLine";
          }
          {
            key = "gR";
            mode = "v";
            action = "<Plug>ReplaceWithRegisterVisual";
          }
          {
            key = "J";
            mode = "v";
            action = ":m '>+1<CR>gv=gv";
          }
          {
            key = "K";
            mode = "v";
            action = ":m '<-2<CR>gv=gv";
          }
        ];
        autocmds = [
          {
            desc = "Highlight when yanking (copying) text";
            event = [ "TextYankPost" ];
            callback = lib.generators.mkLuaInline ''
              function()
                vim.hl.on_yank()
              end
            '';
          }
        ];
      };
    };
  };
}
