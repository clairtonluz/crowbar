for f in $(find . -type f -name '*.java'); do
  mv $f $(echo "$f" | sed 's/java$/groovy/')
done
