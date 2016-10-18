This example shows one technique which can be employed in order
to separate source files and object files using gnu make(1).

NOTES:
- since we put the objects in a different folder than the sources
we do not have the guarantee that the folders in which we want
to put them exist. Since the compiler *does not* create folders
for the objects files automatically nor does it have a flag to turn
on such behaviour (at least as far as I know).
This all means that we need to manually create the folder where the
object files will be just in case.
mkdir -p $(dir $@)
will do the trick.
