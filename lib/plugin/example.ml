module Example = struct
  type t = { ctl : string
	   }

  (*
   * Echo what anyone says back to themselves
   *)
  let echo m t =
    let module Cm = Losic.Ctl_message in
    let module Om = Losic.Out_message in
    let dst = Om.Msg.src m in
    let msg = Om.Msg.msg m in
    Losic.Ctl_writer.write
      t.ctl
      (Cm.Message.Msg
	 (Cm.Msg.create ~dst msg));
    t

  let init () =
    { ctl = Sys.argv.(1) }

  let destroy _ = ()

  let handle m t =
    let module Om = Losic.Out_message in
    match Om.message m with
      | Om.Message.Msg msg ->
	echo msg t
      | _ ->
	t

end

module Loop = Losic.Loop.Make(Example)

let main () =
  Loop.run stdin

let () = main ()
