import networkx as nx
import matplotlib.pyplot as plt

# Define the predicates as a list of tuples (source, target)
predicates = [
    ("egidijus", "tomas"),
    ("tomas", "marta"),
    ("tomas", "jonas"),
    ("tomas", "linas"),
    ("algis", "marta"),
    ("algis", "jonas"),
    ("algis", "linas"),
    ("benas", "marta"),
    ("benas", "jonas"),
    ("benas", "linas"),
    ("artiom", "marta"),
    ("artiom", "jonas"),
    ("artiom", "linas"),
    ("marta", "jonas"),
    ("marta", "linas"),
    ("jonas", "linas"),
]

# Create a directed graph
G = nx.DiGraph()

# Add nodes and edges based on the predicates
for source, target in predicates:
    G.add_edge(source, target)

# Create a layout for the nodes
layout = nx.spring_layout(G)

# Increase the figure size
plt.figure(figsize=(12, 8))
node_font = {"font_size": 14, "font_color": "black", "font_weight": "bold"}

# Draw the graph with the specified node font size
nx.draw(
    G,
    layout,
    with_labels=True,
    node_size=800,
    node_color="lightblue",
    **node_font,
    arrowsize=15,
)

# Show the graph
plt.show()
