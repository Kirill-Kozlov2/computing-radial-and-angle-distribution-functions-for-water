#!/usr/bin/gnuplot
set terminal png size 1000,1000
set output "png/rdf_YYYYTemp.png"


set title "RDF for water. T = YYYYTemp K"
set xlabel "R"
set ylabel "RDF"
set grid

plot "data/spce-rdf_YYYYTemp.dat" u 2:3 w l lw 4

reset
set terminal png size 1000,1000
set output "png/adf_YYYYTemp.png"


set title "ADF for water. T = YYYYTemp K"
set xlabel "R"
set ylabel "ADF"
set grid

plot "data/spce-adf_YYYYTemp.dat" u 2:3 w l lw 4
