{
  lib,
  inputs,
  pkgs,
  ...
}:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    plugins = [
      {
        name = "zsh-helix-mode";
        src = "${inputs.zsh-helix-mode.packages.${pkgs.stdenv.system}.zsh-helix-mode}/share/zsh-helix-mode";
      }
      {
        name = "fzf-tab";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
      {
        name = "fast-syntax-highlighting";
        src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/plugins/fast-syntax-highlighting";
      }
      {
        name = "zsh-history-substring-search";
        src = "${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search";
      }
    ];
    history = {
      findNoDups = true;
      saveNoDups = true;
      ignoreAllDups = true;
    };
    initContent = ''
      ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(
        zhm_history_prev
        zhm_history_next
        zhm_prompt_accept
        zhm_accept
        zhm_accept_or_insert_newline
      )
      ZSH_AUTOSUGGEST_ACCEPT_WIDGETS+=(
        zhm_move_right
        zhm_clear_selection_move_right
      )
      ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(
        zhm_move_next_word_start
        zhm_move_next_word_end
      )

      zhm_wrap_widget fzf-tab-complete zhm_fzf_tab_complete
      bindkey '^I' zhm_fzf_tab_complete

      bindkey '^F' autosuggest-accept

      bindkey -M hxnor "$terminfo[kcuu1]" history-substring-search-up
      bindkey -M hxnor "$terminfo[kcud1]" history-substring-search-down
      bindkey -M hxins "$terminfo[kcuu1]" history-substring-search-up
      bindkey -M hxins "$terminfo[kcud1]" history-substring-search-down
    '';
  };
}
