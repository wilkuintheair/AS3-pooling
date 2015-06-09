/**
 * Created by Piotr Wilk.
 */
package utils.pooling {
public class ExpandablePool implements IPool {
    protected var _pool:Vector.<IPoolable> = new Vector.<IPoolable>();
    protected var _counter:int = 0;
    private var _class:Class;

    public function ExpandablePool(clazz:Class) {
        _class = clazz;
    }

    /**
     * This method is used to create items. You can extend this method if you need to pass
     * some parameters to constructor or to use some custom initialization.
     * @return Created item
     */
    protected function createItem():IPoolable {
        return new _class();
    }

    protected function addItemAt(index:int):IPoolable {
        var item:IPoolable = createItem();
        var poolInfo:PoolInfo = new PoolInfo();
        poolInfo.owner = item;
        poolInfo.pool = this;
        item.destroy = poolInfo.destroyCallback;
        if (index < _pool.length) {
            _pool.splice(index, 0, item);
        } else {
            _pool[index] = item;
        }
        return item;
    }

    public function getItem():IPoolable {
        var item:IPoolable;
        if(_counter > 0) {
            item = _pool[--_counter];
        } else {
            item = addItemAt(0);
        }
        item.renew();
        return item;
    }

    public function returnItem(item:IPoolable):void {
        if (!item as _class) {
            throw new Error("Invalid item type. This pool can only contain items of type " + _class);
        }
        _pool[_counter++] = item;
    }
}
}