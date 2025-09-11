#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo
echo "#==========================================================="
echo "Start Times"

for f in $(ls rplpl-slurm*.out rplspl-slurm*.out 2>/dev/null | sort); do
  echo "==> $f <=="
  grep -m1 'time\.struct_time' "$f"
  echo
done

echo "End Times"
for f in $(ls rplpl-slurm*.out rplspl-slurm*.out 2>/dev/null | sort); do
  echo "==> $f <=="
  ending_time_line=$(grep -n 'time\.struct_time' "$f" | tail -n1 | cut -d: -f1)
  if [[ -n "$ending_time_line" ]]; then
    sed -n "${ending_time_line},$((ending_time_line+4))p" "$f"
  fi
  echo
done

echo "#==========================================================="
