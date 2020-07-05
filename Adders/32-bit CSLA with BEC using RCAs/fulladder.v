module fulladder(a,b,cin,sum,cout);

input a,b,cin;
output sum,cout;
reg sum,cout;


always @(a,b,cin) 

begin
sum = a ^ b ^ cin;
cout = (a & b) | (b & cin) | (cin & a);
end



endmodule









