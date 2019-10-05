create or replace type body apps_json_array is

  constructor function apps_json_array return self as result is
  begin
    self.elements := apps_json_nodes();
    return;
  end;

  constructor function apps_json_array(
    p_elements   apps_json_nodes
  ) return self as result is
  begin
    self.elements := p_elements;
    return;
  end;
  --
  overriding member function node_type return varchar2 is
  begin
    return apps_json_api.C_TYPE_ARRAY;
  end;
  --
  overriding member function to_string return varchar2 is
    l_result varchar2(32767);
  begin
    for i in 1..self.elements.count loop
      l_result := l_result || case when i > 1 then ',' end || self.elements(i).to_string();
    end loop;
    return self.node_name_full || '[' || l_result || ']';
  end;

end;
/