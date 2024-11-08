class ValueCacher<T> {
  T cachedValue;
	final T Function() getValueCallback;
	
  ValueCacher({
		required this.cachedValue,
		required this.getValueCallback,
	});

	refreshValue() {
		cachedValue = getValueCallback();
	}

}