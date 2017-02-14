def bfs(node, val)
  queue = [node]

  until queue.empty?
    current_node = queue.shift
    return current_node if current_node.value == val
    queue += current_node.children
  end

  nil
end
