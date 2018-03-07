library(DiagrammeR)
library(tidyverse)

###
# Create a simple graph
# and display it
###

library(DiagrammeR)

base_graph <- create_graph() %>%
  add_node(label = 'QTL') %>%
  set_node_position(node = 1, x = 0, y = 2) %>%
  add_node(label = 'ht', x = 1) %>%
  set_node_position(node = 2, x = -0.5, y = 1) %>%
  add_node(label = 'wt', x = 2) %>%
  set_node_position(node = 3, x = 0.5, y = 1) %>%
  add_edge(from = 'QTL', to = 'ht') %>%
  add_edge(from = 'ht', to = 'wt') %>%
  select_nodes(conditions = TRUE) %>%
  set_node_attrs_ws(node_attr = fillcolor, value = 'white') %>%
  set_node_attrs_ws(node_attr = color, value = 'black') %>%
  set_node_attrs_ws(node_attr = fontcolor, value = 'black') %>%
  clear_selection() %>%
  select_edges(conditions = TRUE) %>%
  set_edge_attrs_ws(edge_attr = color, value = 'black') %>%
  clear_selection()

base_graph %>%
  export_graph(file_name = 'graph_mm.pdf', file_type = 'pdf', width = 300, height = 300)

base_graph %>%
  set_node_attrs(node_attr = 'label', values = 'v(ht)', nodes = 2) %>%
  export_graph(file_name = 'graph_vm.pdf', file_type = 'pdf', width = 300, height = 300)

base_graph %>%
  set_node_attrs(node_attr = 'label', values = 'v(wt)', nodes = 3) %>%
  export_graph(file_name = 'graph_mv.pdf', file_type = 'pdf', width = 300, height = 300)

base_graph %>%
  set_node_attrs(node_attr = 'label', values = 'v(ht)', nodes = 2) %>%
  set_node_attrs(node_attr = 'label', values = 'v(wt)', nodes = 3) %>%
  export_graph(file_name = 'graph_vv.pdf', file_type = 'pdf', width = 300, height = 300)
