{ lib, pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    installRemoteServer = true;
    mutableUserKeymaps = false;
    mutableUserTasks = false;
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
        context = "vim_mode == normal || vim_mode == visual";
        bindings = {
          s = "vim::PushSneak";
          S = "vim::PushSneakBackward";
        };
      }
      {
        context = "!Editor || !menu && vim_mode == normal";
        bindings = {
          "space space" = "file_finder::Toggle";
          "space f" = [
            "task::Spawn"
            {
              task_name = "File Finder";
              reveal_target = "center";
            }
          ];
          "space /" = [
            "task::Spawn"
            {
              task_name = "Find in Files";
              reveal_target = "center";
            }
          ];
          "space b" = "tab_switcher::ToggleAll";
          "space e" = "workspace::ToggleRightDock";
          "space t" = "project_panel::ToggleFocus";
          "space g" = "git_panel::ToggleFocus";
          "space a" = "agent::ToggleFocus";
          "space p" = "markdown::OpenPreviewToTheSide";
          "space r" = "projects::OpenRecent";
          "space w" = "editor::ToggleSoftWrap";
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
      "html"
      "lua"
      "mcp-server-context7"
      "mcp-server-github"
      "mdx"
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
        languages =
          let
            jsLike = {
              formatter = [ ];
              code_actions_on_format = {
                "source.fixAll.eslint" = true;
              };
            };
          in
          {
            JavaScript = jsLike;
            TypeScript = jsLike;
            TSX = jsLike;
            Nix = {
              language_servers = [
                "nil"
                "!nixd"
              ];
            };
            Markdown = {
              format_on_save = "on";
            };
          };
        lsp = {
          package-version-server.binary.path = lib.getExe pkgs.package-version-server;
          nil = {
            settings = {
              nix.flake.autoArchive = true;
              formatting = {
                command = [ "nixfmt" ];
              };
            };
          };
        };
        colorize_brackets = true;
        features = {
          edit_prediction_provider = "none";
        };
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
