{ pkgs, ... }:

let
  wasmPkgs = pkgs.pkgsCross.wasm32-wasip1;
  # TODO: Add this plugin in nixpkgs and use via zellijPlugins
  zellij-room = wasmPkgs.rustPlatform.buildRustPackage (finalAttrs: {
    pname = "zellij-room";
    version = "1.2.1";

    src = pkgs.fetchFromGitHub {
      owner = "rvcas";
      repo = "room";
      tag = "v${finalAttrs.version}";
      hash = "sha256-KHCt4U0uqK/qkTGq2/Jf5bqBBhVDqAgFh80RPpU/KY0=";
    };

    nativeBuildInputs = [ wasmPkgs.lld ];

    installPhase = ''
      cp target/wasm32-wasip1/release/room.wasm $out
    '';

    env.RUSTFLAGS = "-C linker=wasm-ld";

    cargoHash = "sha256-CtaMzE72YV/DPPhjxL6LCvA03J8MneSOnMdy4mkyXvE=";
  });
in

{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    attachExistingSession = true;
    exitShellOnExit = true;
    settings = {
      default_layout = "main";
      default_mode = "locked";
      keybinds = {
        shared = {
          _children = [
            {
              bind = {
                _args = [ "Ctrl ." ];
                _children = [
                  {
                    LaunchOrFocusPlugin = {
                      _args = [ "room" ];
                      _children = [
                        {
                          floating = true;
                          ignore_case = true;
                        }
                      ];
                    };
                  }
                ];
              };
            }
          ];
        };
      };
      session_serialization = false;
      show_startup_tips = false;
    };
    plugins = [
      zellij-room
    ];
    layouts = {
      main.layout._children = [
        {
          default_tab_template._children = [
            { children = { }; }
            {
              pane = {
                _props = {
                  size = 1;
                  borderless = true;
                };
                plugin._props.location = "status-bar";
              };
            }
          ];
        }
        {
          tab = {
            _props = {
              name = "Root";
            };
          };
        }
        {
          tab = {
            _props = {
              name = "Edit";
            };
          };
        }
        {
          tab = {
            _props = {
              name = "Chat";
            };
          };
        }
        {
          tab = {
            _props = {
              name = "sh#1";
            };
          };
        }
        {
          tab = {
            _props = {
              name = "sh#2";
            };
          };
        }
        {
          tab = {
            _props = {
              name = "sh#3";
            };
          };
        }
      ];
    };
  };
}
