#!/usr/bin/gnuplot
set terminal png size 1000,1000
set output "png/rdf_300.png"


set title "RDF for water. T = 300 K"
set xlabel "R"
set ylabel "RDF"
set grid

plot "data/spce-rdf_300.dat" u 2:3 w l lw 4

reset
set terminal png size 1000,1000
set output "png/adf_300.png"


set title "ADF for water. T = 300 K"
set xlabel "R"
set ylabel "ADF"
set grid

plot "data/spce-adf_300.dat" u 2:3 w l lw 4
