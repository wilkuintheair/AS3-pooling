/**
 * Created by Piotr Wilk.
 */
package utils.pooling {
public interface IPool {

    function getItem():IPoolable;

    function returnItem(item:IPoolable):void;

}
}
