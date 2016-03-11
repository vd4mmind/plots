

# A plotting R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800


# --------------------------------------------------------------------------
# If you don't have the ggplot2 package installed, uncomment the following line:
# install.packages( "ggplot2" );
# Modified a bit from the custom code
library( ggplot2 );
# --------------------------------------------------------------------------
# If you don't have the scales package installed, uncomment the following line:
# install.packages( "scales" );
library( scales );
as.numeric.factor <- function(x) {seq_along(levels(x))[x]}

# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency_%","plot_X","plot_Y","plot_size","log10_p_value","uniqueness","dispensability");
revigo.data <- rbind(c("GO:0006584","catecholamine metabolic process", 0.123,-1.912, 3.672, 2.037,-2.1261,0.823,0.000),
c("GO:0007156","homophilic cell adhesion via plasma membrane adhesion molecules", 0.489, 0.081, 5.570, 2.633,-5.6498,0.882,0.000),
c("GO:0022610","biological adhesion", 2.826,-2.530, 1.627, 3.395,-1.6737,0.966,0.000),
c("GO:0032502","developmental process",13.055,-4.082, 1.531, 4.059,-1.7670,0.969,0.000),
c("GO:0051094","positive regulation of developmental process", 1.985, 5.133,-4.348, 3.241,-3.5591,0.437,0.000),
c("GO:0043949","regulation of cAMP-mediated signaling", 0.034,-4.107,-5.009, 1.491,-1.9626,0.816,0.059),
c("GO:0051239","regulation of multicellular organismal process", 5.506,-4.532,-0.920, 3.684,-1.4237,0.882,0.103),
c("GO:0042127","regulation of cell proliferation", 3.148,-1.989,-7.532, 3.442,-1.4214,0.797,0.154),
c("GO:0051240","positive regulation of multicellular organismal process", 1.418, 4.416, 0.491, 3.095,-1.6882,0.599,0.218),
c("GO:0023051","regulation of signaling", 6.570,-4.771,-3.200, 3.761,-1.9830,0.827,0.271),
c("GO:0021527","spinal cord association neuron differentiation", 0.026, 5.178,-1.429, 1.380,-2.6676,0.571,0.291),
c("GO:0048522","positive regulation of cellular process", 8.548,-0.795,-7.054, 3.875,-2.3206,0.775,0.297),
c("GO:0031325","positive regulation of cellular metabolic process", 5.082,-0.701,-6.603, 3.649,-1.4271,0.745,0.327),
c("GO:0010646","regulation of cell communication", 6.570,-1.802,-6.768, 3.761,-1.9586,0.759,0.340),
c("GO:0050796","regulation of insulin secretion", 0.352,-3.239,-5.819, 2.491,-1.7305,0.725,0.373),
c("GO:0035108","limb morphogenesis", 0.455, 6.515,-1.369, 2.602,-1.6925,0.498,0.380),
c("GO:0009952","anterior/posterior pattern specification", 0.642, 5.975,-1.383, 2.751,-1.7258,0.542,0.395),
c("GO:0035295","tube development", 1.620, 6.132,-2.366, 3.153,-1.3778,0.514,0.440),
c("GO:0007389","pattern specification process", 1.143, 6.665,-2.137, 3.002,-1.3372,0.533,0.452),
c("GO:0050793","regulation of developmental process", 4.431, 5.883,-4.506, 3.590,-3.1403,0.489,0.503),
c("GO:0044707","single-multicellular organism process",15.092, 6.107, 1.566, 4.122,-1.8210,0.632,0.520),
c("GO:0051962","positive regulation of nervous system development", 0.057, 4.803,-3.312, 1.708,-1.5575,0.509,0.523),
c("GO:0048598","embryonic morphogenesis", 1.501, 6.298,-2.102, 3.120,-1.6180,0.486,0.551),
c("GO:0001763","morphogenesis of a branching structure", 0.639, 6.577,-1.634, 2.750,-1.4737,0.527,0.572),
c("GO:0035239","tube morphogenesis", 0.904, 6.868,-2.126, 2.900,-1.4260,0.508,0.594),
c("GO:0009966","regulation of signal transduction", 5.885,-2.285,-6.172, 3.713,-1.7328,0.727,0.600),
c("GO:0033604","negative regulation of catecholamine secretion", 0.022,-3.188,-5.065, 1.301,-1.4157,0.796,0.609),
c("GO:0048729","tissue morphogenesis", 1.464, 6.811,-3.580, 3.109,-1.4365,0.514,0.628),
c("GO:0009887","organ morphogenesis", 2.260, 6.445,-2.526, 3.298,-1.4237,0.457,0.662),
c("GO:0098609","cell-cell adhesion", 0.585, 0.129, 5.647, 2.711,-3.8601,0.891,0.663),
c("GO:0048856","anatomical structure development",11.534, 6.354,-3.763, 4.005,-2.6253,0.471,0.671),
c("GO:0018958","phenol-containing compound metabolic process", 0.269,-2.343, 3.552, 2.375,-1.3925,0.845,0.704),
c("GO:0009653","anatomical structure morphogenesis", 5.999, 6.489,-3.902, 3.721,-1.4609,0.488,0.712),
c("GO:0045597","positive regulation of cell differentiation", 1.436, 3.822,-4.424, 3.101,-2.9031,0.395,0.730),
c("GO:0051960","regulation of nervous system development", 1.545, 5.704,-2.889, 3.133,-1.6737,0.401,0.736),
c("GO:0051093","negative regulation of developmental process", 1.731, 5.487,-4.428, 3.182,-2.0825,0.448,0.747),
c("GO:0050767","regulation of neurogenesis", 1.387, 4.153,-3.743, 3.086,-1.9626,0.354,0.778),
c("GO:0007155","cell adhesion", 2.821, 0.289, 5.572, 3.394,-1.6819,0.884,0.796),
c("GO:0060284","regulation of cell development", 1.721, 4.085,-4.796, 3.179,-2.3706,0.398,0.799),
c("GO:2000026","regulation of multicellular organismal development", 3.472, 5.369,-3.207, 3.484,-3.4802,0.379,0.818),
c("GO:0021515","cell differentiation in spinal cord", 0.121, 5.397,-1.844, 2.029,-1.4179,0.537,0.830),
c("GO:0050769","positive regulation of neurogenesis", 0.373, 4.042,-3.851, 2.516,-1.4353,0.405,0.832),
c("GO:0010720","positive regulation of cell development", 0.509, 4.062,-4.615, 2.651,-1.7167,0.428,0.835),
c("GO:0044767","single-organism developmental process",12.982, 6.457,-4.000, 4.057,-1.7282,0.456,0.843),
c("GO:0030182","neuron differentiation", 2.824, 5.459,-2.762, 3.394,-1.4168,0.411,0.853),
c("GO:0045595","regulation of cell differentiation", 3.246, 3.775,-4.641, 3.455,-3.1568,0.381,0.878),
c("GO:0009712","catechol-containing compound metabolic process", 0.123,-1.988, 3.729, 2.037,-2.1586,0.830,0.881));

one.data <- data.frame(revigo.data);
names(one.data) <- revigo.names;
one.data <- one.data [(one.data$plot_X != "null" & one.data$plot_Y != "null"), ];
one.data$plot_X <- as.numeric( as.character(one.data$plot_X) );
one.data$plot_Y <- as.numeric( as.character(one.data$plot_Y) );
one.data$plot_size <- as.numeric( as.character(one.data$plot_size) );
one.data$log10_p_value <- as.numeric( as.character(one.data$log10_p_value) );
one.data$frequency <- as.numeric( as.character(one.data$frequency) );
one.data$uniqueness <- as.numeric( as.character(one.data$uniqueness) );
one.data$dispensability <- as.numeric( as.character(one.data$dispensability) );
#head(one.data);


# --------------------------------------------------------------------------
# Names of the axes, sizes of the numbers and letters, names of the columns,
# etc. can be changed below

p1 <- ggplot( data = one.data );
p1 <- p1 + geom_point( aes(plot_X, plot_Y, colour = log10_p_value, size = plot_size), alpha = I(0.6) );
p1 <- p1 + scale_colour_gradientn(colours = c("blue", "green","yellow","red" ), limits = c(min(as.numeric(one.data$log10_p_value)), max(as.numeric(one.data$log10_p_value))));
p1 <- p1 + geom_point( aes(plot_X, plot_Y, size = plot_size), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) )) + scale_size_area();
p1 <- p1 + scale_size( range=c(2, 20)) + theme_classic()# + scale_fill_gradientn(colours = heat_hcl(7), limits = c(-300, 0) );
ex <- one.data [ one.data$dispensability < 0.1, ]; ## reduced the dispensability for fitting
p1 <- p1 + geom_text( data = ex, aes(plot_X, plot_Y, label = description), colour = I(alpha("black", 0.75)), size = 2 ); ## reduced the size
p1 <- p1 + labs (y = "semantic space Y", x = "semantic space X");
p1 <- p1 + theme(legend.key = element_blank()) ;
one.x_range = max(one.data$plot_X) - min(one.data$plot_X);
one.y_range = max(one.data$plot_Y) - min(one.data$plot_Y);
p1 <- p1 + xlim(min(one.data$plot_X)-one.x_range/10,max(one.data$plot_X)+one.x_range/10);
p1 <- p1 + ylim(min(one.data$plot_Y)-one.y_range/10,max(one.data$plot_Y)+one.y_range/10);



# --------------------------------------------------------------------------
# Output the plot to screen

p1;

# Uncomment the line below to also save the plot to a file.
# The file type depends on the extension (default=pdf).

# ggsave("C:/Users/path_to_your_file/revigo-plot.pdf");
