/**
 * Created by Piotr Wilk.
 */
package utils.pooling {
/**
 * Execute this method when component is ready to be returned to pool
 * Setter should only be used by IPool implementations.
 * If you want to implement your own behaviour you can use following @example:
 <listing version="3.0">
     private var _callback:Function;

     public function get destroy():Function {
        return internalCallback;
     }

     public function set destroy(value:Function):void {
        _callback = value;
     }

     private function internalCallback():void {
         // Your destruction code
         _callback();
     }
 </listing>
 */
public interface IPoolable {

    /**
     * Reset component's state before it can be retrieved from pool
     */
    function renew():void;

    /**
     * Execute this method when component is ready to be returned to pool
     * Setter should only be used by IPool implementations.
     */
    function get destroy():Function;

    /**
     * @private
     */
    function set destroy(callback:Function):void;
}
}
