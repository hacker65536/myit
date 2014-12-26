public class SingletonStaticBlock {
    private static final SingletonStaticBlock instance;

    static {
        try {
            instance = new SingletonStaticBlock();
        } catch (Exception e) {
            throw new RuntimeException("Darn, an error occurred!", e);
        }
    }

    public static SingletonStaticBlock getInstance() {
        return instance;
    }

    private SingletonStaticBlock() {
        // ...
    }
}
