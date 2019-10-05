declare
  j apps_json_string;
begin
  j := apps_json_string('a', 'a');
  dbms_output.put_line(j.to_string());
end;
/
declare
  j apps_json_object;
  o apps_json_object;
begin
  j := apps_json_object();
  o := apps_json_object(apps_json_nodes(j.a('a','a'), j.a('A','A')));
  o.a(
    'b', 'b'
  );
  o.a(
    j.a('c','c'),
    j.a('d','d'),
    p_attrs => apps_json_nodes(j.a('q','q'),j.a('w','w'))
  );
  o.a('obj', j.o(
    j.a('a1','a1'),
    j.a('b1','b1')
  ));
  o.a('array',
      j.array(apps_json_nodes(
        j.el('A'),
        j.o(
          j.a('a3','a3')
  ))));
  dbms_output.put_line(o.to_string());
  --dbms_output.put_line(xmltype.createXML(o).getClobVal);
end;
/
exit
/