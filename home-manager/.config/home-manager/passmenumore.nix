{ pkgs }:

pkgs.writeTextFile {
  name = "passmenumore";
  destination = "/bin/passmenumore";
  executable = true;

  text = ''
  #!/usr/bin/env bash
  
  shopt -s nullglob globstar
  
  otp=0
  login=0
  if [[ $1 == "--otp" ]]; then
      otp=1
      shift
  elif [[ $1 == "--login" ]]; then
      login=1
      shift
  fi

  
  if [[ -n $WAYLAND_DISPLAY ]]; then
      dmenu=bemenu
      xdotool="ydotool type --file -"
  elif [[ -n $DISPLAY ]]; then
      dmenu=dmenu
      xdotool="xdotool type --clearmodifiers --file -"
  else
      echo "Error: No Wayland or X11 display detected" >&2
      exit 1
  fi
   
  prefix=''${PASSWORD_STORE_DIR-~/.password-store}
  password_files=( "$prefix"/**/*.gpg )
  password_files=( "''${password_files[@]#"$prefix"/}" )
  password_files=( "''${password_files[@]%.gpg}" )
  
  password=$(printf '%s\n' "''${password_files[@]}" | "$dmenu" "$@")
  
  [[ -n $password ]] || exit
  
  if [[ $otp -eq 1 ]]; then
    pass otp -c "$password" 2>/dev/null
  elif [[ $login -eq 1 ]]; then
    pass login -c "$password" 2>/dev/null
  else
    pass -c "$password" 2>/dev/null
  fi
  '';

}
