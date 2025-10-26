{ ... }:

{
  programs.zed-editor = {
    enable = true;
    userKeymaps = [
      {
        context = "vim_operator == a || vim_operator == i || vim_operator == cs";
        bindings = {
          q = "vim::AnyQuotes";
          b = "vim::AnyBrackets";
          Q = "vim::MiniQuotes";
          B = "vim::MiniBrackets";
        };
      }
      {
        context = "!menu && vim_mode == normal";
        bindings = {
          "space f f" = [
            "task::Spawn"
            {
              task_name = "File Finder";
              reveal_target = "center";
            }
          ];
          "space f g" = [
            "task::Spawn"
            {
              task_name = "Find in Files";
              reveal_target = "center";
            }
          ];
          "space f b" = "tab_switcher::ToggleAll";
          "space t" = "project_panel::ToggleFocus";
          "space g" = "git_panel::ToggleFocus";
          "space a" = "agent::ToggleFocus";
        };
      }
    ];
    extensions = [
      "astro"
      "codebook"
      "colored-zed-icons-theme"
      "docker-compose"
      "dockerfile"
      "emmet"
      "env"
      "git-firefly"
      "github-theme"
      "html"
      "lua"
      "mcp-server-context7"
      "mcp-server-github"
      "nix"
      "php"
      "prisma"
      "scss"
      "sql"
      "toml"
      "vue"
    ];
    userSettings =
      let
        default_width = 360;
        dock = "right";
      in
      {
        vim_mode = true;
        buffer_font_features = {
          calt = false;
        };
        ui_font_features = {
          calt = false;
        };
        icon_theme = "Colored Zed Icons Theme Dark";
        title_bar = {
          show_branch_name = false;
          show_project_items = false;
          show_onboarding_banner = false;
          show_user_picture = false;
          show_sign_in = false;
        };
        toolbar = {
          breadcrumbs = false;
          quick_actions = false;
        };
        status_bar = {
          active_language_button = false;
          cursor_position_button = false;
        };
        tab_bar.show = false;
        project_panel = {
          inherit dock default_width;
          auto_fold_dirs = false;
        };
        search = {
          button = false;
        };
        global_lsp_settings = {
          button = false;
        };
        diagnostics = {
          button = false;
        };
        git_panel = {
          inherit dock;
        };
        collaboration_panel = {
          inherit dock default_width;
          button = false;
        };
        outline_panel = {
          inherit dock default_width;
          button = false;
        };
        notification_panel = {
          inherit default_width;
          button = false;
        };
        terminal = {
          button = false;
        };
        languages = {
          JavaScript = {
            code_actions_on_format = {
              "source.fixAll.eslint" = true;
            };
          };
          TypeScript = {
            code_actions_on_format = {
              "source.fixAll.eslint" = true;
            };
          };
          TSX = {
            code_actions_on_format = {
              "source.fixAll.eslint" = true;
            };
          };
          Nix = {
            language_servers = [
              "nil"
              "!nixd"
            ];
          };
        };
        lsp = {
          nil = {
            settings = {
              nix.flake.autoArchive = true;
              formatting = {
                command = [ "nixfmt" ];
              };
            };
          };
        };
        features = {
          edit_prediction_provider = "none";
        };
        restore_on_startup = "none";
        telemetry = {
          diagnostics = false;
          metrics = false;
        };
      };
    userTasks = [
      {
        label = "File Finder";
        command = "zed \"$(tv files)\"";
        hide = "always";
        allow_concurrent_runs = true;
        use_new_terminal = true;
      }
      {
        label = "Find in Files";
        command = "zed \"$(tv text)\"";
        hide = "always";
        allow_concurrent_runs = true;
        use_new_terminal = true;
      }
    ];
  };
}
