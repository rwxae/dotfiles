{
  lib,
  stdenv,
  fetchFromGitHub,
  makeWrapper,
  coreutils,
  flameshot,
  swaylock,
  systemd,
  wireplumber,
}:

stdenv.mkDerivation {
  pname = "rofi-system";
  version = "2025-08-29";

  src = fetchFromGitHub {
    owner = "wardxela";
    repo = "rofi-system";
    rev = "25d036978942fd6aafd9165a3bdf66ba64f6272d";
    hash = "sha256-Gc904igcK60WjI/D9mOj2PII/2y13R/upXA0oR98Qag=";
  };

  nativeBuildInputs = [ makeWrapper ];

  postFixup = ''
    wrapProgram $out/bin/rofi-system \
      --set PATH ${
        lib.makeBinPath [
          coreutils
          flameshot
          swaylock
          systemd
          wireplumber
        ]
      }
  '';

  installPhase = ''
    install -Dm755 rofi-system $out/bin/rofi-system
  '';

  meta = {
    description = "Raycast-inspired extension to perform some system-level things using Rofi";
    mainProgram = "rofi-system";
    homepage = "https://github.com/wardxela/rofi-system";
    platforms = lib.platforms.linux;
    license = lib.licenses.gpl3;
  };
}
