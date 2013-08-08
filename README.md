This is a simple Rails app that I'm using to explore some strange [CanCan](https://github.com/ryanb/cancan) behaviour.

The [Accessing parent in ability](https://github.com/ryanb/cancan/wiki/Nested-Resources#accessing-parent-in-ability) section of the CanCan docs talk about checking permissions through an association. That appears to work correctly in some cases, but not when you supply an STI instance as the key in the hash. See the `AbilityTest` for the failing test.
