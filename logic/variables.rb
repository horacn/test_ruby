# 变量
# created by hezhao on 2018-05-12 14:49

# Ruby 支持五种类型的变量：
# 一般小写字母、下划线开头：局部变量（Variable）。
# $开头：全局变量（Global variable）。
# @开头：实例变量（Instance variable）。
# @@开头：类变量（Class variable）类变量被共享在整个继承链中
# 大写字母开头：常量（Constant）。


# 全局变量
$global_veriabe = 10

class Class1
  def print_global # 函数没有参数可以不写()
    # 注意：在 Ruby 中，您可以通过在变量或常量前面放置 # 字符，来访问任何变量或常量的值。
    puts "全局变量在 Class1 中输出为 #$global_veriabe"
    $global_veriabe = 20
  end
end

class Class2
  def print_global
    puts "全局变量在 Class2 中输出为 #$global_veriabe"
  end
end

class1obj = Class1.new
class1obj.print_global # 函数没有参数可以不写()

class2obj = Class2.new
class2obj.print_global


# 实例变量
class Customer
  def initialize(id, name, addr)
    @cust_id=id
    @cust_name=name
    @cust_addr=addr
  end

  def display_details()
    puts "Customer id #@cust_id"
    puts "Customer name #@cust_name"
    puts "Customer address #@cust_addr"
  end
end

# 创建对象
cust1 = Customer.new("1","Tom","深圳")
cust2 = Customer.new("2","Bob","上海")

# 调用方法
cust1.display_details
cust2.display_details


# 类变量
# 类变量以 @@ 开头，且必须初始化后才能在方法定义中使用。
# 引用一个未初始化的类变量会产生错误。类变量在定义它的类或模块的子类或子模块中可共享使用。

class Customer2
  @@no_of_customers=0

  def total_no_of_customers
    @@no_of_customers+=1
    puts "Total number of customers: #@@no_of_customers"
  end
end

# 创建对象
cust1 = Customer2.new
cust2 = Customer2.new

# 调用方法
cust1.total_no_of_customers
cust2.total_no_of_customers



# 局部变量
# 局部变量以小写字母或下划线 _ 开头。局部变量的作用域从 class、module、def 或 do 到相对应的结尾或者从左大括号到右大括号 {}。
# 当调用一个未初始化的局部变量时，它被解释为调用一个不带参数的方法。
# 对未初始化的局部变量赋值也可以当作是变量声明。变量会一直存在，直到当前域结束为止。局部变量的生命周期在 Ruby 解析程序时确定。
var1 = 1
puts var1



# 常量
# 常量以大写字母开头。定义在类或模块内的常量可以从类或模块的内部访问，定义在类或模块外的常量可以被全局访问。
# 常量不能定义在方法内。引用一个未初始化的常量会产生错误。对已经初始化的常量赋值会产生警告。

GLOBAL_VAR = 300

class Example
  VAR1 = 100
  VAR2 = 200

  def show
    puts "常量1为 #{VAR1}"
    puts "常量2为 #{VAR2}"
    puts "全局常量为 #{GLOBAL_VAR}"
  end
end

object = Example.new
object.show
# 通过两个冒号引用一个常量
puts Example::VAR1



# 伪变量
# 它们是特殊的变量，有着局部变量的外观，但行为却像常量。您不能给这些变量赋任何值。
#   self: 当前方法的接收器对象。
#   true: 代表 true 的值。
#   false: 代表 false 的值。
#   nil: 代表 undefined 的值。
#   __FILE__: 当前源文件的名称。
#   __LINE__: 当前行在源文件中的编号。