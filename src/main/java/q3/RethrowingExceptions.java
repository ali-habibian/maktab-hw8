package q3;

public class RethrowingExceptions {
    public static void main(String[] args) {
        RethrowingExceptions rethrowingExceptions = new RethrowingExceptions();

        try {
            rethrowingExceptions.someMethod();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void someMethod() throws Exception {
        try {
            someMethod2();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    private void someMethod2() throws Exception {
        throw new Exception("Exception in someMethod2");
    }
}
