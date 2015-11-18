function Path = edgestopath(path)

stack = path;
val   = paths(1,1);
Path  = [val];
while(~isempty(stack))    
    idx = find(stack(:,1)==val,1);
    
    if isempty(idx)
        idx = find(stack(:,2)==val,1);
        val = stack(idx,1);
    else
        val = stack(idx,2);
    end
    
    Path(end+1) = val;
    stack(idx,:)=[];
end

end