# 创建字符串
str = "sinar \t"  # 双引号会生效转义字符
str = 'sinar \t'  # 单引号不会生效转义字符
# 内嵌表达式（字符串模板）
str2 = "hello #{str}"

# 如果字符串中频繁出现 "" ''，为了避免每次转义，可以使用%Q，%q
str = %Q(可以直接出现：""'')  # 相当于用双引号创建
str2 = %q(可以直接出现：''"") # 相当于用单引号创建
puts str
puts str2

# 使用 Here Document 创建字符串
# Here Document 起源于 UNIX 的 shell 的一种程序写法，采用 << 创建字符串
# 创建 +包含换行的字符串+ 时，这种方法比较简单
# << 后的结束标识符可以使用 "" 或 ''，”“ 会激活转义字符，'' 不会激活
# 如果使用既没有 "" 也没有 '' 的字符串时会被认为是 "" 创建的字符串
str << "Hello"
puts str
# 我们一般将 +EOF+（文件结尾） 或者 +EOB+（块结尾） 作为 +结束标识符+ 使用
10.times do |i|
  print <<"EOB"
i: #{i}
EOB
end
# 如果需要整齐，可以使用 <<- 这样就会自动过滤掉 +结束标识符前面+ 的空字符（空格制表）
10.times do |i|
  print <<-EOB
i: #{i}
  EOB
end
# 然后可以使用 <<~ 来消除行首空白，这样内容的缩进也整齐了（只支持 2.3 版本以上）
10.times do |i|
  print <<~EOB
    i: #{i}
  EOB
end


# 未完待续