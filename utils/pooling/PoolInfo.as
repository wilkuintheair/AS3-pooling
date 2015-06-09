/**
 * Created by Piotr Wilk.
 */
package utils.pooling {
internal class PoolInfo {
    public var owner:IPoolable;
    public var pool:IPool;

    public function PoolInfo() {
    }

    public function destroyCallback():void {
        pool.returnItem(owner);
    }
}
}
