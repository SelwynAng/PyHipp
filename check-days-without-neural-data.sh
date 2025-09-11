for d in 2018*/; do
  day="${d%/}"
  case "$day" in
    (20181101|20181102|20181105) continue ;;
  esac

  if ! find "$day" -type d -regex '.*/channel[0-9]{3}$' -print -quit | grep -q .; then
    count=$(find "$day" -type f -name '*.hkl' | wc -l)
    printf "%s\t%s\n" "$day" "$count"
  fi
done
