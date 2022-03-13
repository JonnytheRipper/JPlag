package de.jplag.exceptions;

/**
 * Exceptions for problems with the basecode submission that lead to an preemptive exit.
 */
public class BasecodeException extends ExitException {

    private static final long serialVersionUID = -3911476090624995247L; // generated

    public BasecodeException(String message) {
        super(message);
    }

    public BasecodeException(String message, Throwable cause) {
        super(message, cause);
    }
}
