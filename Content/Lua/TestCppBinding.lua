-- test cpp binding
local f1=Foo(1024)
local ee =f1:testEnum("hi",3)
print("enum is " ..  type(ee) .. " " .. tostring(ee))
local str=Foo.getStr()
-- f2 not collect
local f2=Foo.getInstance()
f1:bar(str)
f2:bar(str)
-- call base function
f1:baseFunc1()

-- test tfunction
f1:setCallback(function(i) print("callback from cppbinding",i) end)
f1:docall()
-- test lambda 
f1:helloWorld()

local f3=FooChild(2048)
f3:virtualFunc()
f3:bar("f3")
f3:baseFunc1()
f3:setEventListener(function()
    print("event fired")
end)
f3:eventTrigger()

local arr = slua.Array(UEnums.EPropertyClass.Int)
arr:Add(1)
arr:Add(2)
arr:Add(3)
local map = slua.Map(UEnums.EPropertyClass.Int, UEnums.EPropertyClass.Str)
map:Add(4,"400")
map:Add(5,"500")
f3:testArrMap(100,arr,map)
local ret = f3:testArrMap2(200,arr,map)
print(tostring(ret))

local f=FooChild(0)
local arr = f:getTArray()
for i=1,arr:Num() do
    print("arr value",i,arr:Get(i-1))
end

local map = f:getTMap()
for k,v in pairs(map) do
    print("map value",k,v)
end

local boxptr = f:getBoxPtr()
print("box value",boxptr:getValue())