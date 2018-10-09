for i in _posts/*; do
    fileName=`basename $i`
    permalink=$(cat $i | grep ^permalink | cut -d" " -f2)
    ampPermalink=${permalink}amp/
    echo $permalink
    echo $ampPermalink
    redirectFile=redirects/$fileName
    if [[ ! -f $redirectFile ]]; then
        touch $redirectFile
        echo "---" >> $redirectFile
        echo "layout: redirect" >> $redirectFile
        echo "permalink: $ampPermalink" >> $redirectFile
        echo "newUrl: $permalink" >> $redirectFile
        echo "---" >> $redirectFile
    fi
done

