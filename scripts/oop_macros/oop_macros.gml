function oop_macros() {
	// These macros are standard methods for class definition scripts
#macro constructor "constructor"
#macro destructor "destroy"

#macro test "test" // testing entry point

#macro get_parent "get_parent"
#macro get_object_index "get_object_index"

#macro get_class_info "get_class_info"
#macro get_clients "get_clients"

	// macros that can be given to factory methods for class props and method parameter info classes
	// default is borrowed and injected
	// #macro BORROWED 0
	// #macro INJECTED 0
#macro OWNED 1
#macro NOT_INJECTED 2

#macro MARK arg_mark()


}
