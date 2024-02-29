function process_eel_script {
  local input_script="$1"
  local output_script="$2"
  local replace_str="$3"  # New argument for the replacement

  # Process the second script and append its contents to the output script
  sed -r -e "s/\/\/IF${replace_str}|\/\*IF${replace_str}\{|\}IF${replace_str}\*\///" \
    "$input_script" > "$output_script"
}

process_eel_script vocalrediso.jsfx-template vocalrediso.test TEST
process_eel_script vocalrediso.jsfx-template vocalrediso.eel EEL
process_eel_script vocalrediso.jsfx-template vocalrediso.jsfx JSFX
process_eel_script vocalredisoBlurry.jsfx-template vocalredisoBlurry.test TEST
process_eel_script vocalredisoBlurry.jsfx-template vocalredisoBlurry.eel EEL
process_eel_script vocalredisoBlurry.jsfx-template vocalredisoBlurry.jsfx JSFX