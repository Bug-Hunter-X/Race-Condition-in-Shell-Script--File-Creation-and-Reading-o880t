# Race Condition in Shell Scripting

This repository demonstrates a common, yet subtle, race condition that can occur in shell scripts when dealing with file I/O operations that are not atomic. The script attempts to create a file and then immediately read from it.  If the file creation and reading operations are not synchronized perfectly, the read operation may occur before the file is fully written to, resulting in unexpected empty content or errors.

## Reproducing the Bug

1. Clone this repository.
2. Run the `bug.sh` script.
3. Observe the output. The file contents might be empty due to the race condition.

## Solution

The `bugSolution.sh` script demonstrates a safer approach using proper synchronization mechanisms (though simple ones in this case).  While not perfectly eliminating all potential races, it makes the problem far less likely. More robust solutions would involve tools like locks or better file system interfaces.

## Mitigation

Avoid directly reading a newly-created file in a script without an intervening delay or explicit synchronization to ensure proper write completion before reading. Consider using a more robust method, like ensuring the file is fully written before reading, perhaps by adding error handling and retries or using atomic file operations if your system supports them.