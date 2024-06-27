{lib, ...}:
{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "CaskaydiaCove Nerd Font Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      font_size = 9;
      window_padding_width = 25;
      background_opacity = lib.mkDefault 1;
      background_tint = "0.2";
      dynamic_background_opacity = true;
      background_blur = 1;

      enable_audio_bell = false;
      visual_bell_duration = "0.01";
    };
  };
}
