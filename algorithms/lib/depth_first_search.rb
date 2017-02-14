def dfs(node, val)
  return node if node.value == val

  node.children.each do |child|
    search_res = dfs(child, val)
    return serach_res if search_res
  end

  nil
end
