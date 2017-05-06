function source_code_pro_install -d "install Source Code Font"
  switch (uname)
    case Linux
      echo "Linux"
    case Darwin
      wget -N -nv -np -r --level=1 -nd -e robots=off -A.ttf https://mirrors.tuna.tsinghua.edu.cn/adobe-fonts/source-code-pro/TTF/ -P ~/Library/Fonts/
    case '*'
      echo "No support"
  end
  echo "Done ..."
end
