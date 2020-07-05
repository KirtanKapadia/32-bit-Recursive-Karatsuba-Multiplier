module mux_21(a,b,select,m_out);
input a,b,select;
output m_out;


assign m_out=(select)?b:a;

endmodule
