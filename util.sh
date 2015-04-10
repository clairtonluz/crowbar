for f in $(find . -type f -name '*.groovy'); do
  mv $f $f.tmp
  sed 's/import java.util.*//g' $f.tmp > $f
  rm -f $f.tmp
done
