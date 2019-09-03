import android.util.Log;

import junit.framework.TestCase;

import androidx.test.filters.SmallTest;

import com.googlecode.eyesfree.opticflow.OpticalFlow;

public class OpticalFlowTest extends TestCase {
    private static final String TAG = OpticalFlowTest.class.getSimpleName();

    @SmallTest
    public void testInit() {
        OpticalFlow of = new OpticalFlow();
        of.initialize(360, 240, 2);
        assertTrue(of != null);
    }
}
