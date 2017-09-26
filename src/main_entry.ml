open Format;;
let get_xml =
  "<?xml version=\"1.0\"?>

  <soap:Envelope
  xmlns:soap=\"http://www.w3.org/2003/05/soap-envelope/\"
  soap:encodingStyle=\"http://www.w3.org/2003/05/soap-encoding\">

    <soap:Body>
    </soap:Body>

  </soap:Envelope>"

let input = (0, get_xml)

let () =
  let i = Xmlm.make_input (`String input) in
  let rec pull i depth =
    match Xmlm.input i with
    | `El_start tag -> Xmlm.pp_tag std_formatter tag ; print_endline "" ; pull i (depth + 1)
    | `El_end -> if depth = 1 then () else pull i (depth - 1)
    | `Data _ -> pull i depth
    | `Dtd dd -> Xmlm.pp_dtd std_formatter dd ; pull i depth
  in
  pull i 0;
  if not (Xmlm.eoi i) then invalid_arg "document not well-formed"
